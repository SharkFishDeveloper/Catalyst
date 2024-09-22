
import express from "express";
import fs from "fs";
import path from "path";
import { exec } from "child_process";

const app = express();
app.use(express.json());


app.post("/submit-code",async(req,res)=>{
    const {code,language} = req.body;
    if(language === "cpp" || language === "c"){
        const __dirname = process.cwd();
        fs.writeFileSync(`../cpp-engine/app/main.${language}`,code);
        const filePath = path.resolve(__dirname, `../cpp-engine/app/main.${language}`);

        const dockerCommand = `docker run --rm -v ${filePath}:/usr/src/app/cpp-engine/app/main.cpp --ulimit cpu=5 full ./scripts/cpp_run.sh cpp `;
        await exec(dockerCommand, (error, stdout, stderr) => {
            if (error) {
              console.error(`Error: ${stderr}`);
              return res.send(stderr)
            }
            console.log(`Output: ${stdout}`);
            return res.send(stdout)
          });
    }
})

app.post("/bulk",async(req,res)=>{
})

app.listen(2000);