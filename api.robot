***Settings***

Library     RequestsLibrary
Library     Collections


*** Variables ***

&{headers}          accept=application/json        Content-Type=application/json                 #robotcode:ignore

&{body}        
     ...    nome=Jéssica Pimentel Testes    
     ...    email=jfcmpteste@qa.com.br    
     ...    password=1234567    
     ...    administrador=true

&{newBody}        
     ...    nome=Jéssica Pimentel Testes    
     ...    email=jfcmteste@qa.com.br    
     ...    password=123456    
     ...    administrador=true


&{loginBody}           
     ...    email=jfcmpteste@qa.com.br   
     ...    password=1234567

&{products}  
    ...    nome="Desodor"
    ...    preco=14
    ...    descricao="Perfumariaa"
    ...    quantidade=100
    
    


*** Test Cases ***

# Create User - API
#     [Tags]    Create 

#     Create Session    alias= teste_API    url= https://serverest.dev       headers=${headers}      disable_warnings= true

#    ${response}    POST On Session        alias= teste_API    url= /usuarios    json=${body}    expected_status=any
#    Status Should Be    201    msg=Cadastro realizado com sucesso
#    log     ${response.json()} 
#    ${_id}    Get From Dictionary    ${response.json()}    _id
#    Log To Console     ${id}
#    Set Global Variable     ${id_global}        ${id} 

# Read User - API 

#     Create Session    alias= teste_API    url= https://serverest.dev       headers=${headers}      disable_warnings= true

#        ${response}    GET On Session        alias= teste_API    url= /usuarios/${id_global}       expected_status=any    #robotcode:ignore
#         Status Should Be    200    msg=${id_global}     #robotcode:ignore
#         log     ${response.json()}


# UpDate User - API

#         Create Session    alias= teste_API    url= https://serverest.dev       headers=${headers}      disable_warnings= true

#             ${response}   PUT On Session        alias= teste_API    url= /usuarios/${id_global}    json=${newBody}           expected_status=any     #robotcode:ignore
#             Status Should Be    200    msg=Registro alterado com sucesso

# Delete User - API

#      Create Session    alias= teste_API    url= https://serverest.dev       headers=${headers}      disable_warnings= true

#                  ${response}   DELETE On Session        alias= teste_API    url= /usuarios/${id_global}           expected_status=any        #robotcode:ignore
#                  Status Should Be    200    msg=Registro excluído com sucesso            

Login - API
    [Tags]    Login

    Create Session    alias= teste_API    url= https://serverest.dev       headers=${headers}      disable_warnings= true

     ${response}    POST On Session        alias= teste_API    url= /login    json=${loginBody}    expected_status=any
       Status Should Be    200    msg=Login realizado com sucesso

       log     ${response.json()} 
       ${authorization}    Get From Dictionary    ${response.json()}    authorization
       Log To Console     ${_authorization}
       Set Global Variable     ${authorization_global}        ${_authorization}

Cadastro - API
    [Tags]  CadastroProduto

      ${var}    Create Dictionary          accept=application/json        Content-Type=application/json        Authorization=${authorization_global}          #robotcode:ignore

    Create Session    alias= teste_API    url= https://serverest.dev       headers=${var}      disable_warnings= true
    
         ${response}    POST On Session        alias= teste_API    url=/produtos    json=${products}    expected_status=any
         Status Should Be    201    msg=Cadastro realizado com sucesso
         log     ${response.json()} 
           ${_idProduct}    Get From Dictionary    ${response.json()}    _id
           Log To Console     ${idProduct}     
           Set Global Variable     ${idProduct_global}        ${idProduct} 



    
   



    



    







