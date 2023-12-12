const express = require('express');
const { exec } = require('child_process');

const app = express();
const port = 3000;

app.get('/deploy_deploy_membership', (req, res) => {
    exec('npx hardhat run scripts/deploy.js --network xrplsidechain', (error, stdout, stderr) => {
        if (error) {
            console.error(`exec error: ${error}`);
            return res.send(`exec error: ${error}`);
        }
        console.log(`stdout: ${stdout}`);
        console.error(`stderr: ${stderr}`);
        res.send(`stdout: ${stdout}`);
    });
});

app.get('/interact_join_membership', (req, res) => {
    exec('npx hardhat run scripts/interact.js --network xrplsidechain', (error, stdout, stderr) => {
        if (error) {
            console.error(`exec error: ${error}`);
            return res.send(`exec error: ${error}`);
        }
        console.log(`stdout: ${stdout}`);
        console.error(`stderr: ${stderr}`);
        res.send(`stdout: ${stdout}`);
    });
});

app.get('/deploy_deploy_loyalty', (req, res) => {
    exec('npx hardhat run scripts/deploy_loyalty.js --network xrplsidechain', (error, stdout, stderr) => {
        if (error) {
            console.error(`exec error: ${error}`);
            return res.send(`exec error: ${error}`);
        }
        console.log(`stdout: ${stdout}`);
        console.error(`stderr: ${stderr}`);
        res.send(`stdout: ${stdout}`);
    });
});

app.get('/interact_increment_loyalty', (req, res) => {
    exec('npx hardhat run scripts/increment.js --network xrplsidechain', (error, stdout, stderr) => {
        if (error) {
            console.error(`exec error: ${error}`);
            return res.send(`exec error: ${error}`);
        }
        console.log(`stdout: ${stdout}`);
        console.error(`stderr: ${stderr}`);
        res.send(`stdout: ${stdout}`);
    });
});

app.listen(port, () => {
    console.log(`Server is running at http://localhost:${port}`);
});