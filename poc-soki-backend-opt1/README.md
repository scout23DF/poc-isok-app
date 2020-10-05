# PoC :: Authentication and Authorization throughout Proxy Using Spring-Security-OAuth2 to Handle KeyCloak

[KeyCloak](http://www.keycloak.org) was chosen as the Web-SSO solution to provide Authentication and Authorization on _____ applications.

KeyCloak is based on OAuth2 and OpenConnectId protocols to generate and handle the exchange of "JWT - JSON Web Tokens" between the OAuthServer/OIDC Server, Resources and Client Applications. We recommend the reading of KeyCloak documentation. 

__________ Application was setup to use "Spring Security" and its submodules to integrate to KeyCloak.

Then before running this App, some infrastructure services should be already started. See how to make them work properly in the next section.

## Running KeyCloak

### Pre-Requisites:

[TO ADJUST]
 - [Docker Compose](https://docs.docker.com/compose/) version 1.8.0+

In the Development Environment, KeyCloak and its dependencies services can be run in Docker Containers throughout Docker-Compose. Follow the steps below:

- Clone the project: [___________________________)](https://github.com/scout23DF/????.git)
- Make sure you are at the right branch where there's the implementation of KeyCloak setup;   
- Aiming to get ________________ and KeyCloak databases already created and loaded before to start KeyCloak Container, do this:

  * Find and unzip the file below: 
     * `[project-dir]/src/main/docker/backups-docker-volumes/docker-volumes-bkp-[newest-date].zip`
     * to some folder you have write rights. (e.g.: your `User's Home` folder's root);
  * Open and edit the file: `[project-dir]/src/main/docker/.env`;
  * Change all Volume path's in each Environment Variable, point to the folder where you've unzipped the backup file mentioned earlier, like this:
    * `VOLUME_MYSQL_SRV_01_DATA_PATH={Folder Where You Extracted the ZIP Backup File}/docker-volumes/mysql-srv-01/data/`

- Build and start the Docker containers issuing the following command:
````
> [project-dir]/src/main/docker/clear && docker-compose up
````
- If each container has started properly, then you have the following services:

[TO ADJUST]
````
> Port 3306 : MySQL Instance for PhyCuS-HFC App database
> Port 3307 : MySQL Instance for KeyCloak database;
> Port 9999 : PhpMyAdmin tool;
> Ports  25 / 465 / 587: MailServer
> Port 9080 : KeyCloak Admin Console;
````
  
- Log in KeyCloak Admin Console:

````
* URL:      http://localhost:9080/auth
* User:     admin
* Password: Pa55w0rd
````
       
- Navigate in this console and inspect the Realm, Clients, Roles, Groups and Users created for Testing purposes.

## Building and Running this App

[TO DO]

## Stopping All Services in Docker Containers

[TO DO]

## Know Issues

[TO DO]




POSTMAN Test:
http://localhost:8085/api/sso/public/register

{
    "id": null,
    "username": "zezinho.simpleUser01",
    "password": "123456",
    "rememberMe": true,
    "email": "zezinho@jaburu.com.br",
    "firstName": "Jose",
    "lastName": "Bocoio", 
    "enabled": "true"  
}