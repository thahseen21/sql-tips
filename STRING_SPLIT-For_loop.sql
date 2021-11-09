-- To demonstrate STRING_SPLIT and While loop in SP

CREATE OR ALTER PROCEDURE spDummy
AS
BEGIN

    --Declaring a local variable as table with below constraints
    DECLARE @UserList TABLE(
        RowId INT Identity(1,1),
        UserId INT
        )

    DECLARE @RowCount INT
    DECLARE @UserId INT

    -- Inserting values into the UserList table through STRING_SPLIT function
    INSERT INTO @UserList
        (UserId)
    SELECT *
    FROM STRING_SPLIT('6,7,8,9',',')

    select *
    from @UserList

    --Assigning the total count of the UserList
    SELECT @RowCount=COUNT(UserId)
    FROM @UserList

    --Checks whether the row is above 0
    WHILE @RowCount > 0
    BEGIN

        --Displays the user by the rowId
        SELECT @UserId = UserId
        from @UserList
        WHERE RowId = @RowCount

        PRINT @UserId

        --Decrement the value of the rowcount
        SET @RowCount = @RowCount - 1

    END

END
GO

EXEC spDummy