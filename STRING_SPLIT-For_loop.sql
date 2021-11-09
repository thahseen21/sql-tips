-- To demonstrate STRING_SPLIT and While loop in SP

CREATE OR ALTER PROCEDURE spDummy
AS
BEGIN

    DECLARE @UserList TABLE(
        RowId INT Identity(1,1),
        UserId INT
        )

    DECLARE @RowCount INT
    DECLARE @UserId INT

    INSERT INTO @UserList
        (UserId)
    SELECT *
    FROM STRING_SPLIT('6,7,8,9',',')

    select *
    from @UserList

    SELECT @RowCount=COUNT(UserId)
    FROM @UserList

    WHILE @RowCount > 0
    BEGIN

        SELECT @UserId = UserId
        from @UserList
        WHERE RowId = @RowCount

        PRINT @UserId

        SET @RowCount = @RowCount - 1

    END

END
GO

EXEC spDummy