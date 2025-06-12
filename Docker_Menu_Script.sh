#!/bin/bash

# Docker Menu Script to Interact with the user to apply some Docker Management Operations.

while true; do  # Creating continuous loop until user exits the program.
    clear  # Clear terminal screen every loop.
    echo "======Welcome to Our Docker Management Menu======"
    echo "1. List all Docker images"
    echo "2. List all Docker containers (including stopped ones)"
    echo "3. Delete a Docker container"
    echo "4. Pull a Docker image from Docker Hub"
    echo "5. Restart a Docker container"
    echo "6. Exit"
    echo "================================================"
    
    read -p "Please Choose your option from 1 to 6 ;) " choice  # Asking the user for the input number then  Assign user input to $choice

    case $choice in # Case like switch instead of using if conditions to check the input and act accordingly
        1)
            echo -e "\n📦 Your Docker Images are:"
            docker images #List all images using docker CLI.
            ;;
        2)
            echo -e "\n📋 Your Docker Containers (Running + Stopped):"
            docker ps -a # List all container (Running + Stopped) using docker CLI
            ;;
        3)
            read -p "Enter the Container ID or Name to delete: " container_name # Taking Container Name from the user and assign to variable to use the variable in the docker command.
            docker rm "$container_name" && echo "✅ The Container '$container_name' has been deleted." || echo "❌ Failed to delete container." #Use AND and OR to validate the success of failure of the cmd.
            ;;
        4)
            read -p "Enter the Image Name to pull (e.g., ubuntu:latest, nginx:latest): " image_name # Taking Image name from the user and assign it to variable to use in Docker CMD.
            docker pull "$image_name" && echo "✅ Image '$image_name' pulled successfully." || echo "❌ Failed to pull image." #USe AND and OR to validate the success or failure of the docker CLI cmd.
            ;;
        5)
            echo -e "\n Please find the info of all Containers:"
            docker ps -a
            read -p "Enter the Container ID or Name to restart: " container_restart_name # Taking Container name from the user in order to use in Docker CLI Cmd.
            docker restart "$container_restart_name" && echo "✅ Container '$container_restart_name' restarted." || echo "❌ Failed to restart container." # Use AND and OR to validate the success of failure of the Docker CLI Cmd.
            ;;
        6)
            echo "👋 Exiting the Docker menu. Goodbye!"
            break
            ;;
        *)
            echo "⚠️ Invalid option. Please choose between 1 and 6."
            ;;
    esac # Indicates the end of the case switching.

    echo -e "\nPress Enter to return to the menu..."
    read
done # end of the While



