```bash
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
# Command-Line Arguments
# You can pass arguments to your script when you execute it.
# $1, $2, $3, ... are used to access the arguments.
echo "Argument 1: $1"
echo "Argument 2: $2"
echo "All arguments: $@"
echo "Number of arguments: $#"

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

# String comparison operators:
# = : Equal to
# != : Not equal to
# -z : Check if string is empty
# -n : Check if string is not empty

string1="hello"
string2="world"

if [ "$string1" = "hello" ]; then
    echo "string1 is hello"
fi

if [ "$string1" != "$string2" ]; then
    echo "string1 and string2 are different"
fi

if [ -z "$empty_string" ]; then
    echo "empty_string is empty"
fi

if [ -n "$string1" ]; then
    echo "string1 is not empty"
fi

# -------------------------------------------------------
# File Conditions
# You can check the type or properties of files using conditions.

# -d : Check if it's a directory
# -f : Check if it's a regular file
# -x : Check if it's executable
# -r : Check if it's readable
# -w : Check if it's writable
# -e : Check if file exists

file="./file.txt"  # File path we want to check

if [ -f "$file" ]; then
    echo "$file exists and is a regular file."
elif [ -d "$file" ]; then
    echo "$file exists and is a directory."
else
    echo "$file does not exist."
fi

if [ -e "$file" ]; then
    echo "$file exists."
fi

if [ -r "$file" ]; then
    echo "$file is readable."
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

# For loop: Looping through a list of items
for item in "apple" "banana" "cherry"; do
    echo "Fruit: $item"
done

# While loop: Continues looping as long as the condition is true
count=1
while [ $count -le 5 ]; do
    echo "Count is $count"
    ((count++))  # Increment count by 1
done

# Until loop: Continues looping until the condition is true
count=1
until [ $count -gt 5 ]; do
    echo "Count is $count"
    ((count++))
done

# -------------------------------------------------------
# Functions
# Functions allow you to encapsulate blocks of code and reuse them throughout your script.

# Define a function
my_function() {
    echo "This is my first function!"
    echo "Argument 1 inside function: $1"
    echo "Argument 2 inside function: $2"
}

# Call the function
my_function "Hello" "World"

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

echo "Another message" >> output.txt # Append to the file.
cat output.txt

# Redirecting errors
echo "This is an error message" 2> error.txt  # Writes errors to error.txt
cat error.txt  # Displays the error content

# Redirecting standard output and error
echo "Standard output and error" &> combined.txt
cat combined.txt

# Here Documents
cat <<EOF
This is a multi-line string.
It can contain multiple lines.
EOF

# Here Strings
echo <<< "This is a single line string"

# -------------------------------------------------------
# Piping
# Piping is used to send the output of one command as the input to another.

echo "Hello" | tr 'a-z' 'A-Z'  # Converts text to uppercase
echo "Hello" | rev  # Reverses the string
echo "Hello World" | grep "World" #Find a pattern

# -------------------------------------------------------
# Exit Statuses
# Every command returns an exit status (also called return code). A status of 0 means success, and any non-zero value indicates an error.

# Run a command and check its exit status using $?
echo "Hello"
if [ $? -eq 0 ]; then  # Checks if the last command was successful (exit status 0)
    echo "The previous command was successful."
else
    echo