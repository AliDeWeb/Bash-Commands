#!/bin/bash

# -------------------------------------------------------
# Hello World
echo "Hello World"
# This is the most basic script you can write, simply printing a message to the terminal.

# -------------------------------------------------------
# Variables
# Variables are used to store values, which can then be used or modified later.
# Variables in Bash do not require type declarations.
name="Ali"   # String variable
age=20       # Integer variable

echo "My name is $name and I am $age years old"
# $name and $age are used to access the values of the variables.

# -------------------------------------------------------
# System Variables
# These are environment variables automatically set by the system.
echo "Current user: $USER"   # Prints the username of the person running the script.
echo "Home directory: $HOME" # Prints the home directory of the current user.
echo "Current directory: $PWD" # Prints the current working directory.

# -------------------------------------------------------
# Input
# We can use the `read` command to take input from the user during script execution.
echo "Enter your name: "
read user_name
echo "Hello $user_name"

# The `-p` flag allows you to prompt for input on the same line.
read -p "Enter your age: " user_age
echo "You are $user_age years old"

# -------------------------------------------------------
# Conditions
# Conditional statements are used to perform different actions based on conditions.

# Numerical comparison operators:
# -eq : Equal to
# -ne : Not equal to
# -gt : Greater than
# -lt : Less than
# -ge : Greater than or equal to
# -le : Less than or equal to

if [ 18 -eq 18 ]; then
    echo "18 equals 18"
fi

# The next condition will not print since 18 is equal to 18.
if [ 18 -ne 18 ]; then
    echo "18 not equals 18"
fi

# This condition checks if 18 is greater than 18, which it is not, so it won't print.
if [ 18 -gt 18 ]; then
    echo "18 is greater than 18"
fi

# Similarly, this checks if 18 is less than 18, which is false.
if [ 18 -lt 18 ]; then
    echo "18 is less than 18"
fi

# Checks if 18 is greater than or equal to 18, which is true.
if [ 18 -ge 18 ]; then
    echo "18 is greater or equal to 18"
fi

# Checks if 18 is less than or equal to 18, which is true.
if [ 18 -le 18 ]; then
    echo "18 is less or equal to 18"
fi

# -------------------------------------------------------
# File Conditions
# You can check the type or properties of files using conditions.

# -d : Check if it's a directory
# -f : Check if it's a regular file
# -x : Check if it's executable
# -r : Check if it's readable
# -w : Check if it's writable

file="./file.txt"  # File path we want to check

if [ -f "$file" ]; then
    echo "$file exists and is a regular file."
elif [ -d "$file" ]; then
    echo "$file exists and is a directory."
else
    echo "$file does not exist."
fi

# -------------------------------------------------------
# Combined Conditions
# You can combine multiple conditions using logical operators to create complex conditions.

# AND: Both conditions must be true
if [ 18 -ge 18 ] && [ 20 -gt 15 ]; then
    echo "Both conditions are true"  # This will print since both conditions are true.
fi

# OR: At least one of the conditions must be true
if [ 18 -ge 18 ] || [ 20 -lt 15 ]; then
    echo "At least one condition is true"  # This will print because the first condition is true.
fi

# NOT: Inverts the condition (true becomes false and vice versa)
if ! [ -f "$file" ]; then
    echo "$file is not a regular file"  # This will print if the file doesn't exist or is not a regular file.
fi

# -------------------------------------------------------
# Case Statements
# The `case` statement is a way to match a variable or value against multiple patterns.
# It's similar to a switch-case statement in other languages.

echo "Enter a number between 1 and 3: "
read number

case $number in
    1) 
        echo "You selected option 1."
        ;;
    2)
        echo "You selected option 2."
        ;;
    3)
        echo "You selected option 3."
        ;;
    *)
        echo "Invalid option selected!"  # This is the default case if the input doesn't match any of the above.
        ;;
esac

# -------------------------------------------------------
# Loops
# Loops are used to repeat actions multiple times.

# For loop: Looping through a specified range of numbers
for i in {1..5}; do
    echo "Iteration $i"  # This will print from 1 to 5.
done

# While loop: Continues looping as long as the condition is true
count=1
while [ $count -le 5 ]; do
    echo "Count is $count"
    ((count++))  # Increment count by 1
done

# -------------------------------------------------------
# Functions
# Functions allow you to encapsulate blocks of code and reuse them throughout your script.

# Define a function
my_function() {
    echo "This is my first function!"
}

# Call the function
my_function

# -------------------------------------------------------
# Arithmetic
# You can perform arithmetic calculations in Bash using `((...))` or the `expr` command.

# Using $((...)) for arithmetic calculations
result=$(( 5 + 3 ))  # Adds 5 and 3
echo "The result of 5 + 3 is: $result"

# Using expr for arithmetic calculations (older method)
result=$(expr 5 + 3)  # Adds 5 and 3
echo "The result of 5 + 3 using expr is: $result"

# -------------------------------------------------------
# Redirecting Output
# You can redirect the output of a command to a file using `>` or `>>`, or redirect errors using `2>`.
# You can also redirect both standard output and error.

echo "This is a message" > output.txt  # Writes to the file (overwrites)
cat output.txt  # Displays the content of output.txt

# Redirecting errors
echo "This is an error message" 2> error.txt  # Writes errors to error.txt
cat error.txt  # Displays the error content

# -------------------------------------------------------
# Piping
# Piping is used to send the output of one command as the input to another.

echo "Hello" | tr 'a-z' 'A-Z'  # Converts text to uppercase
echo "Hello" | rev  # Reverses the string

# -------------------------------------------------------
# Exit Statuses
# Every command returns an exit status (also called return code). A status of 0 means success, and any non-zero value indicates an error.

# Run a command and check its exit status using $?
echo "Hello"
if [ $? -eq 0 ]; then  # Checks if the last command was successful (exit status 0)
    echo "The previous command was successful."
else
    echo "The previous command failed."
fi

# -------------------------------------------------------
# Trap
# The `trap` command is used to catch signals (like Ctrl+C) and perform actions before exiting the script.

trap 'echo "Ctrl+C was pressed!"' SIGINT  # Catch Ctrl+C signal
echo "Press Ctrl+C to see the trap in action"

# -------------------------------------------------------
# Comments
# Comments are lines of text in the script that are not executed. They are useful for adding explanations and notes.

# This is a comment explaining the code below.
echo "This is a comment in the script"  # This is an inline comment
