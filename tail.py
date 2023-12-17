def sum(lst, total=0):
    """
    Sums a list of numbers using tail recursion.

    Args:
    lst (list): A list of numbers to be summed.
    total (int, optional): The initial value of the sum. Defaults to 0.

    Returns:
    int: The sum of the numbers in the list.
    """
    # If the list is empty, return the total sum
    if len(lst) == 0:
        return total
    # Recursively call the function with the tail of the list and the updated total sum
    return sum(lst[1:], total + lst[0]) # Remove the first element of the list and add it to the total sum





def factorial(number, total=1):
    """
    Returns the factorial value of any number.

    Args:
    - number (int): the number to calculate the factorial of
    - total (int): the running total of the factorial calculation (default=1)

    Returns:
    - int: the factorial value of the input number
    """
    # base case: if the input number is 0, return the running total
    if number == 0:
        return total
    # recursive case: multiply the running total by the current number and call the function again with number - 1
    else:
        return factorial(number - 1, total * number)