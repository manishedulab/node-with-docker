FROM ubuntu

RUN apt-get update
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get upgrade -y
RUN apt-get install -y nodejs

WORKDIR /app

COPY package.json package.json
COPY package-lock.json package-lock.json

RUN npm install


COPY . .

#  jaise humari bahut sari file ko docker file me dalana hai to ek ek karke copy karne ke bajay hum ye command bhi use kar sakate hai 
# COPY . .    iska matlab ye hai ki jo bhi mere parent folder me hai sab copy kar de uske parent folder me 

# lekin isase node module bhi chale jayega isiliye hum log docker ignore use karenge 

# kabhi bhi hame root folder me copy nahi karna chahiye usake liye ek folder bana lena chahiye suppose app banaya

# hame yaha bar bar app likhana pad raha hai har file ke pahale usako overcome karne ke liye hum log ye commmand use kar sakte hai 

# WORKDIR /app


ENTRYPOINT [ "node", "app.js"]

