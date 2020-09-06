const amplifyconfig = '''{
  "UserAgent": "aws-amplify-cli/2.0",
  "Version": "1.0",
  "auth": {
      "plugins": {
          "awsCognitoAuthPlugin": {
              "IdentityManager": {
                  "Default": {}
              },
              "CognitoUserPool": {
                  "Default": {
                      "PoolId": "ap-southeast-1_p0lZgJ16z",
                      "AppClientId": "tgadtu7fjqg9pg7qug97uded4",
                      "AppClientSecret": "kfilpne5q7605vmp48448lrugjlsld4sadams6d87lvlta5buqr",
                      "Region": "ap-southeast-1"
                  }
              },
              "Auth": {
                  "Default": {
                      "authenticationFlowType": "USER_SRP_AUTH"
                  }
              }
          }
      }
  }
}''';