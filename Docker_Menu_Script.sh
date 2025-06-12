#!/bin/bash

# ==============================================================================
# Docker Menu Script
# This interactive script allows the user to perform basic Docker management
# operations through a terminal-based menu interface.
# ==============================================================================

while true; do  # Creating continuous loop until user exits the program.
    clear  # Clear terminal screen every loop.
    echo "====== Docker Management Menu ======"
    echo "1. List all Docker images"
    echo "2. List all Docker containers (including stopped ones)"
    echo "3. Delete a Docker container"
    echo "4. Pull a Docker image from Docker Hub"
    echo "5. Restart a Docker container"
    echo "6. Exit"
    echo "===================================="
    
    read -p "Please choose your option from 1 to 6: " choice  # Asking the user for the input number then assign it to $choice

# Case like switch instead of using if conditions to check the input and act accordingly.
    case $choice in 
        1)
            echo -e "\nYour Docker images:"
            docker images  # List all images using Docker CLI.
            ;;
        2)
            echo -e "\nYour Docker containers (Running + Stopped):"
            docker ps -a  # List all containers (Running + Stopped) using Docker CLI.
            ;;
        3)
            read -p "Enter the Container ID or Name to delete: " container_name  # Taking container name from the user and assigning it to a variable to use in the Docker command.
            docker rm "$container_name" && echo "The container '$container_name' has been deleted successfully." || echo "Failed to delete container."  # Use AND and OR to validate success or failure of the command.
            ;;
        4)
            read -p "Enter the Image Name to pull (e.g., ubuntu:latest, nginx:latest): " image_name  # Taking image name from the user and assigning it to a variable to use in Docker command.
            docker pull "$image_name" && echo "Image '$image_name' pulled successfully." || echo "Failed to pull image."  # Use AND and OR to validate the success or failure of the Docker CLI command.
            ;;
        5)
            echo -e "\nDisplaying information about all containers:"
            docker ps -a
            read -p "Enter the Container ID or Name to restart: " container_restart_name  # Taking container name from the user to use in Docker CLI command.
            docker restart "$container_restart_name" && echo "Container '$container_restart_name' restarted successfully." || echo "Failed to restart container."  # Use AND and OR to validate success or failure of the Docker CLI command.
            ;;
        6)
            echo "Exiting the Docker menu. Goodbye!"
            break
            ;;
        *)
            echo "Invalid option. Please choose a number between 1 and 6."  # Input validation for wrong menu option.
            ;;
    esac  # Indicates the end of the case switching.

    echo -e "\nPress Enter to return to the menu..."
    read  # Pause before returning to the main menu
done  # End of the while loop
