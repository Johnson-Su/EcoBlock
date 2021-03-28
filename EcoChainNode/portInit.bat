@echo off
SET /p port="Enter HTTP Port: "
IF "%port%" NEQ "" (
    SET HTTP_PORT=%port%
)
SET /p port="Enter P2P Port: "
IF "%port%" NEQ "" (
    SET P2P_PORT=%port%
)

python nodeTester.py