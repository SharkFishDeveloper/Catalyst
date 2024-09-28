
import express from "express";
import fs from "fs";
import path from "path";
import { exec } from "child_process";
import rateLimit from 'express-rate-limit';
import cors from "cors";

const limiter = rateLimit({
    windowMs: 60 * 1000, // 1 minute
    max: 10, // Limit each IP to 10 requests per windowMs
    message: "Too many requests, please try again later."
});

const globalLimiter = rateLimit({
    windowMs: 60  * 1000, // 1 minute
    max: 120, // Limit the total requests to 100 per windowMs
    message: "Server is receiving too many requests, please try again later."
});

const app = express();
app.use(express.json());
app.use(cors());
app.use(globalLimiter);   
app.use('/submit-code', limiter);



app.post("/submit-code",async(req,res)=>{

    const {code,language,stdin} = req.body;
    let shellextension = "";
    let engine = "";
    let fileExtension = "";
    let stdinBool = stdin ? true : false;
  

    switch (language.toLowerCase()){
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
    
    let codeFile = language.toLowerCase() ==="java" ? `Main.${fileExtension}` : language === "js"?`index.${fileExtension}`:`main.${fileExtension}`;

    const __dirname = process.cwd();
    const filePath = path.resolve(__dirname, `./${engine}/app/${codeFile}`);
    console.log("FILEPATH-<>",filePath)

    try {
        fs.writeFileSync(filePath,code);
        console.log("CODE CONTENT->",fs.readFileSync(filePath,"utf-8"))
    } catch (error) {
        console.log("ERROR WRITING FILE ->",filePath,error)
    }
    
    let command = `docker run --rm -v ${filePath}:/usr/src/app/${engine}/app/${codeFile} `;

    if (stdinBool) {
        const inputfilePath = path.resolve(__dirname, `./${engine}/app/input.txt`);
        command += ` -v ${inputfilePath}:/usr/src/app/${engine}/app/input.txt --memory=100m --ulimit cpu=5 catalyst ./${shellextension}`;
        console.log("INPUT FILE->",path.resolve(__dirname,`../${engine}/app/input.txt`,stdin));
        //path.resolve(__dirname,`../${engine}/app/input.txt`,stdin)
        fs.writeFileSync(inputfilePath,stdin);
    }
    //  --ulimit cpu=5 catalyst ./${shellextension}
    //./js-engine/app/index.js
    else if(stdinBool!==""){
        command += `  --ulimit cpu=5 catalyst ./${shellextension}`;
    }
    console.log("DOCKER COMMAND",command)
        const startTime = Date.now();
        await exec(command, (error, stdout, stderr) => {
            const endTime = Date.now(); // Record end time
            const executionTime = endTime - startTime; 
            if (error) {
              console.error(`Error: ${error}`);
              return res.json({stdout:"",executionTime,stderr:stdout,language})
            }
            console.log(`Output: ${stdout}`);
            return res.json({stdout,executionTime,stderr,language})
        });
})

app.get("/languages",async(req,res)=>{
    res.json({languages:"By defualt 5 languages run : C\n,C++\n,Java\n,Python\n,Javascript"})
})

app.get("/",async(req,res)=>{
    res.send({message:"Running Catalyst code engine created by S.F.D"})
})



//* Change port if you want !!
app.listen(2000,()=>console.log("Started on PORT : 2000"));