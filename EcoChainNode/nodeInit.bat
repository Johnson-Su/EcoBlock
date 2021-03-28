@echo off
SET /p fName="Enter First Name: "
SET WALLETFNAME=%fName%
SET /p lName="Enter Last Name: "
SET WALLETLNAME=%lName%
SET /p port="Enter HTTP Port: "
IF "%port%" NEQ "" (
    SET HTTP_PORT=%port%
)
SET /p port="Enter P2P Port: "
IF "%port%" NEQ "" (
    SET P2P_PORT=%port%
)
SET /p keyPath="Enter Private Key File Name: "
IF "%keypath%" NEQ "" (
    SET PRIVATE_KEY=node/wallet/%keypath%
)
SET /p a="Is EcoBoost? (y/n)"
IF "%a%"=="y" (
    SET ECOBOOST=true
)

SET /p a="Start Server? (y/n)"
IF "%a%"=="y" (
    npm start
)



