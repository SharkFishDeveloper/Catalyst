
import express from "express";
import fs from "fs";
import path from "path";
import { exec } from "child_process";

const app = express();
app.use(express.json());


app.post("/submit-code",async(req,res)=>{
    const {code,language,stdin} = req.body;

    let shellextension = "";
    let engine = "";
    let fileExtension = "";
    let stdinBool = stdin ? true : false;
  

    switch (language){
        case "cpp":
        shellextension = "cp.sh cpp"
        engine = `cpp-engine`
        fileExtension = "cpp"
        break;

        case "c":
        shellextension = "cp.sh c"
        engine = `cpp-engine`
        fileExtension = "c"
        break;

        case "python":
        shellextension = stdinBool ?  "py.sh inputtrue" : "py.sh"
        engine = `python-engine`
        fileExtension = "py"
        break;

        case "java":
        shellextension =stdinBool ? "jv.sh inputtrue" : "jv.sh"
        engine = `java-engine`
        fileExtension = "java"
        break;

        case "js":
        shellextension = stdinBool ? "j.sh inputtrue" : "j.sh"
        engine = `js-engine`
        fileExtension = "js"
        break;
    }

    let codeFile = language==="java" ? `Main.${fileExtension}` : language === "js"?`index.${fileExtension}`:`main.${fileExtension}`;

    const __dirname = process.cwd();
    const filePath = path.resolve(__dirname, `../${engine}/app/${codeFile}`);
    console.log("FILEPATH",filePath)
    fs.writeFileSync(filePath,code);
    
    let command = `docker run --rm -v ${filePath}:/usr/src/app/${engine}/app/${codeFile} `;

    if (stdinBool) {
        const inputfilePath = path.resolve(__dirname, `../${engine}/app/input.txt`);
        command += ` -v ${inputfilePath}:/usr/src/app/${engine}/app/input.txt --ulimit cpu=5 full1 ./${shellextension}`;
        fs.writeFileSync(`../${engine}/app/input.txt`,stdin);
    }
    else if(stdinBool!==""){
        command += ` --ulimit cpu=5 full1 ./${shellextension}`;
    }

    // console.log(`Executing command: ${command},`,stdin);

        await exec(command, (error, stdout, stderr) => {
            if (error) {
              console.error(`Error: ${stderr}`);
              return res.send(stderr)
            }
            console.log(`Output: ${stdout}`);
            return res.send(stdout)
          });
    
})

app.get("/languages",async(req,res)=>{
    res.send({languages:"By defualt 5 languages run : C,C++,Java,Python,Javascript"})
})

app.listen(2000);