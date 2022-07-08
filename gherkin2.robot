*** Settings ***
Documentation   Teste Robot ABC

Suite Setup     SuiteSetup
Suite Teardown  SuiteTeardown
Test Setup      TestSetup
Test Teardown   TestTeardown

Library  SeleniumLibrary  timeout=60
Library  ExcelLibrary
Library  ScreenCapLibrary
Library  BuiltIn
Library  Collections
Library  DateTime
Library  Dialogs
Library  OperatingSystem
Library  Process
Library  Screenshot
Library  String
Library  FakerLibrary

*** Variables ***
${BROWSER}  chrome
${SLEEP}    1s
${SPEED}    1s
${EMAIL}    email
${PASSWORD}  password
${locatorPassword}     //input[contains(@data-validate,'isPasswd')]
${locatorEmail}        //input[contains(@id,'email_create')]
${CriarConta}          //span[contains(.,'Create an account')]

*** Test Cases ***
 

Cenario 1 - Campos obrigatorios
    Dado que eu estou na pagina de cadastro
    Quando eu inserir os dados de cadastro
    E eu nao prencher os campos
    Então sera exibida uma mensagem dizendo qual campo é obrigatorio

Cenario 2
    Dado que eu estou na pagina de cadastro
    Quando eu inserir os dados de cadrastro
    E clicar em registrar
    Entao tenho acesso a home da pagina já logado


*** Keywords ***
Cenario 1 -Campos obrigatorios

Dado que eu estou na pagina de cadastro
    Open Browser    http://automationpractice.com/   ${BROWSER}
    Maximize Browser Window  
Quando eu inserir os dados de cadastro      
    #clicando em logar
    Wait Until Element Is Visible    (//a[@href='http://automationpractice.com/index.php?controller=my-account'])[1]
    Click Link        (//a[@href='http://automationpractice.com/index.php?controller=my-account'])[1]
    #Inserindo endereço de e-mail para criar conta
    Wait Until Element Is Visible    //input[contains(@id,'email_create')]
    Input Text    //input[contains(@id,'email_create')]    teste07@ABC.com
    #caso queira simular com um email aleatorio só descomentar a linha abaixo e comentar o input acima
    #EMAILFAKE  
    Click Element    //span[contains(.,'Create an account')]
    #clicando no radio do title  
    Wait Until Element Is Visible    //*[@id="uniform-id_gender1"]/span
    Click Element           //*[@id="id_gender1"]           

E eu nao prencher os campos
    #Inserindo first name
    #Wait Until Element Is Visible    //input[@id='customer_firstname']
    #Input Text    //input[@id='customer_firstname']       
    #Inserindo em Last Name
    #Wait Until Element Is Visible    //input[contains(@id,'customer_lastname')]
    #Input Text    //input[contains(@id,'customer_lastname')]    
    #Inserindo senha ALEATORIA
    #PASSWORDFAKE  
    #inserindo data dia
    Click Element    //select[contains(@id,'days')]            
    Click Element    //*[@id="days"]/option[15]
    #inserindo data mes
    Click Element    //select[contains(@id,'months')]
    Click Element    //*[@id="months"]/option[2]
    #inserindo data ano
    Click Element    //select[contains(@id,'years')]
    Click Element    //*[@id="years"]/option[36]
    #clicando no checkbox receber ofertas especiais
    Click Element    //input[@id='newsletter']
    #INSERIR EMPRESA
    Input Text    //input[contains(@id,'company')]    ABC
    #INSERIR ENDERECO
    Input Text    //input[contains(@id,'address1')]    ESTRADA dos Palmares
    #INSERIR NUMERO
    Input Text    //input[contains(@id,'address2')]    4085
    #INSERIR CIDADE
    Input Text    //input[contains(@id,'city')]    Rio de Janeiro
    #INSERIR PAIS
    Click Element    //select[contains(@id,'id_country')]
    Click Element    //*[@id="id_country"]/option[2]
    #INSERIR INFORMACAO ADICIONAL
    Input Text    //textarea[contains(@id,'other')]    teste ABC
    #INSERIR ESTADO
    Click Element    //select[contains(@id,'id_state')]    
    Click Element    //*[@id="id_state"]/option[34]
    #INSERIR CAIXA POSTAL
    Input Text    //input[contains(@id,'postcode')]    00000
    #INSERIR TELEFONE
    Input Text    //input[@id='phone']    2222222222
    #INSERIR TELEFONE
    Input Text    //input[contains(@id,'phone_mobile')]    2199999999
    #INSERIR ENDERECO ALTENATIVO
    Input Text    //input[contains(@id,'alias')]    RUA B
    #CLICAR EM REGISTRAR
    Click Element    //span[contains(.,'Register')]  
Então sera exibida uma mensagem dizendo qual campo é obrigatorio
    Sleep    2s 
    Page Should Contain    firstname is required.
    Close Browser

cenario 2-validacao ok acesso a HOME

Quando eu inserir os dados de cadrastro
     #clicando em logar
    Wait Until Element Is Visible    (//a[@href='http://automationpractice.com/index.php?controller=my-account'])[1]
    Click Link        (//a[@href='http://automationpractice.com/index.php?controller=my-account'])[1]
    #Inserindo endereço de e-mail para criar conta
    Wait Until Element Is Visible    //input[contains(@id,'email_create')]
    Input Text    //input[contains(@id,'email_create')]    teste07@ABC.com
    #caso queira simular com um email aleatorio só descomentar a linha abaixo e comentar o input acima
    #EMAILFAKE  
    Click Element    //span[contains(.,'Create an account')]
    #clicando no radio do title  
    Wait Until Element Is Visible    //*[@id="uniform-id_gender1"]/span
    Click Element           //*[@id="id_gender1"]           
    #Inserindo first name
    Wait Until Element Is Visible    //input[@id='customer_firstname']
    Input Text    //input[@id='customer_firstname']        Luiz Fernando
    #Inserindo em Last Name
    Wait Until Element Is Visible    //input[contains(@id,'customer_lastname')]
    Input Text    //input[contains(@id,'customer_lastname')]    Silva Souza
    #Inserindo senha ALEATORIA
    PASSWORDFAKE  
    #inserindo data dia
    Click Element    //select[contains(@id,'days')]            
    Click Element    //*[@id="days"]/option[15]
    #inserindo data mes
    Click Element    //select[contains(@id,'months')]
    Click Element    //*[@id="months"]/option[2]
    #inserindo data ano
    Click Element    //select[contains(@id,'years')]
    Click Element    //*[@id="years"]/option[36]
    #clicando no checkbox receber ofertas especiais
    Click Element    //input[@id='newsletter']
    #INSERIR EMPRESA
    Input Text    //input[contains(@id,'company')]    ABC
    #INSERIR ENDERECO
    Input Text    //input[contains(@id,'address1')]    ESTRADA dos Palmares
    #INSERIR NUMERO
    Input Text    //input[contains(@id,'address2')]    4085
    #INSERIR CIDADE
    Input Text    //input[contains(@id,'city')]    Rio de Janeiro
    #INSERIR PAIS
    Click Element    //select[contains(@id,'id_country')]
    Click Element    //*[@id="id_country"]/option[2]
    #INSERIR INFORMACAO ADICIONAL
    Input Text    //textarea[contains(@id,'other')]    teste ABC
    #INSERIR ESTADO
    Click Element    //select[contains(@id,'id_state')]    
    Click Element    //*[@id="id_state"]/option[34]
    #INSERIR CAIXA POSTAL
    Input Text    //input[contains(@id,'postcode')]    00000
    #INSERIR TELEFONE
    Input Text    //input[@id='phone']    2222222222
    #INSERIR TELEFONE
    Input Text    //input[contains(@id,'phone_mobile')]    2199999999
    #INSERIR ENDERECO ALTENATIVO
    Input Text    //input[contains(@id,'alias')]    RUA B
E clicar em registrar   
    #CLICAR EM REGISTRAR
    Click Element    //span[contains(.,'Register')]  
Entao tenho acesso a home da pagina já logado    
    Page Should Contain    Luiz Fernando
    Close Browser


EMAILFAKE
  
   ${email}=  FakerLibrary.email
   Log    ${email}
   Set Test Variable  ${email}
   Input Text  ${locatorEmail}    ${email}
   Click Element  ${CriarConta}
    
PASSWORDFAKE
   
  
   ${Password}=  FakerLibrary.Password
   Log    ${Password}
   Set Test Variable  ${email}
   Input Text  ${locatorPassword}    ${Password}
   
SuiteSetup

    ${VIDEO}  Set Variable  START
    ${EMPTY}  Set Variable  EMPTY
SuiteTeardown
    ${VIDEO}  Set Variable  STOP
    ${EMPTY}  Set Variable  EMPTY
TestSetup
    ${EMPTY}  Set Variable  EMPTY
TestTeardown
    ${EMPTY}  Set Variable  EMPTY
