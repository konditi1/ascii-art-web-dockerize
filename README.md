# ASCII Art Generator -dockerize

Welcome to the ASCII Art Generator project! This web application allows users to input text and instantly convert it into ASCII art. The project also uses a docker-file for building docker images and containers

## Features

- **Text Input:** Enter any text you want to convert into ASCII art.
- **ASCII Art Generation:** Converts the entered text into ASCII art using selected banner styles.
- **Responsive Design:** The application works seamlessly on desktops, tablets, and mobile devices.
- **Dockerfile:** Dockerfile containing instructions to build a docker image

## Technologies Used

- HTML5
- CSS3 (with responsive design principles)
- Go (for handling HTTP requests, responses, and ASCII art generation)
- docker

## Installation

Clone the repository:

```sh
git clone https://github.com/jesee-kuya/ascii-art-web
cd ascii-art-web
```

## Usage

1. **Run the Program:**
   ```sh
   go run .
   ```
   This command starts the ASCII art generator server.

2. **Open the Application:**
   Navigate to `localhost:7050/` in your web browser.

3. **Input Text:**
   Enter the desired text in the provided input field.

4. **Select a Banner:**
   Choose a banner file to style your ASCII art.

5. **Generate ASCII Art:**
   Click on the "Generate" button to create ASCII art based on your input and banner selection.

6. **Copy or Download:**
   Use the "Copy" button to copy the generated ASCII art to your clipboard, or download it as needed.

### usage for dockerfile

First make sure your computer is running docker verion 24.0.7 or latest
<p>To install docker go to their [website](https://www.docker.com/products/docker-desktop) and pick the right version depending on your os</p>

to check on docker version run the command
```sh
docker version
```

After setting the dockerfile with its instructions we run this command to build the image
(ensure your are in the project directory before runnig the commands)
```sh
docker build . -t <image-name>:<tag-name>
```

to view built images we run the command

```sh
docker image ls
```

with an existing image for this web-app we can create the container with the command
```sh
docker run -p <host-port>:<docker-port> <image-name>:<tag-name>
```

we can view if our docker is run by entering the command

```sh
docker ps
```

## Algorithm

The application utilizes HTML templates for the user interface, which communicates with a Go-based server for processing. Here's a simplified breakdown of the process:

- **User Interaction:** HTML form collects user input (text and banner choice).
- **Server-side Processing:** Go server receives the input, retrieves the selected banner file, and generates ASCII art based on the provided text.
- **Response:** ASCII art is returned as a string and displayed on the user interface.

This workflow ensures efficient and seamless conversion of text to ASCII art, tailored to user preferences.

## Authors

- [Jesee Kuya](https://github.com/jesee-kuya)
- [James Muchiri](https://github.com/j1mmy7z7)
- [Fena Onditi](https://github.com/konditi1)

---