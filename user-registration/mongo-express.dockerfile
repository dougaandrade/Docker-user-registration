FROM mongo-express:0.54
EXPOSE 8081

# ENV ME_CONFIG_MONGODB_SERVER=mongodb configuration in port in server mongodb
ENV ME_CONFIG_MONGODB_SERVER=mymongodb
ENV ME_CONFIG_MONGODB_PORT=27017