SELECT Name, Composer FROM tracks;

SELECT BillingCountry as Country,  sum(Total) as total_amount
FROM invoices
GROUP by BillingCountry

SELECT DISTINCT AlbumId, MediaTypeId 
FROM tracks;

SELECT*      
FROM playlists INNER JOIN playlist_track
ON playlists.PlaylistId = playlist_track.PlaylistId

SELECT*      
FROM playlists LEFT OUTER JOIN playlist_track
ON playlists.PlaylistId = playlist_track.PlaylistId


SELECT
    employees.first_name,
    employees.last_name,
    employees.salary,
    departments.dept_name
FROM employees
INNER JOIN departments
    on employees.emp_id = departments.emp_id
WHERE salary > 80000

SELECT
    employees.first_name,
    employees.last_name,
    employees.salary,
    departments.dept_name
FROM employees
INNER JOIN departments
    on employees.emp_id = departments.emp_id
WHERE gender = "Female"
