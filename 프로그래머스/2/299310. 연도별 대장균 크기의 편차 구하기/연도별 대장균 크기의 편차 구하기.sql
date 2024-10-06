-- 코드를 작성해주세요
SELECT
    YEAR(E.DIFFERENTIATION_DATE) AS YEAR,
    (Y.MAX_SIZE - E.SIZE_OF_COLONY) AS YEAR_DEV,
    E.ID
FROM
    ECOLI_DATA AS E, (SELECT
                        MAX(SIZE_OF_COLONY) AS MAX_SIZE,
                        YEAR(DIFFERENTIATION_DATE) AS YEAR
                      FROM 
                        ECOLI_DATA
                      GROUP BY YEAR) AS Y
WHERE YEAR(E.DIFFERENTIATION_DATE)  = Y.YEAR
ORDER BY YEAR, YEAR_DEV