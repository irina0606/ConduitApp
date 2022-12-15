Feature: Articles

  Background: Define URL and Token
    * url apiUrl
    * def dataGenerator = Java.type('helpers.DataGenerator')
    * def createArticleRequestBody = read('classpath:conduitApp/json/newArticleRequest.json')
    * set createArticleRequestBody.article.title = dataGenerator.getRandomArticleValues().title
    * set createArticleRequestBody.article.description = dataGenerator.getRandomArticleValues().description
    * set createArticleRequestBody.article.body = dataGenerator.getRandomArticleValues().body
    * def favoriteArticleBody = {}

  Scenario: Create and delete an article
    Given path 'articles'
    And request createArticleRequestBody
    When method Post
    Then status 200
    * def articleId = response.article.slug


    Given path 'articles', articleId
    When method Delete
    Then status 204