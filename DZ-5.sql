/* ������ 1
	����� � ������� users ���� created_at � updated_at ��������� ��������������. ��������� �� �������� ����� � ��������.
 */
UPDATE users 
SET created_at = NOW(),
	updated_at = NOW()
WHERE created_at IS NULL; -- ���� ���� ���� ����� NULL. ��������� ���

/* ������ 2
	������� users ���� �������� ��������������. 
	������ created_at � updated_at ���� ������ ����� VARCHAR � � ��� ������ ����� ���������� �������� � ������� 20.10.2017 8:10. 
	���������� ������������� ���� � ���� DATETIME, �������� �������� ����� ��������.
 */
UPDATE users
SET created_at = STR_TO_DATE(created_at, '%Y-%m-%d %H:%i:%S'),
    updated_at = STR_TO_DATE(updated_at, '%Y-%m-%d %H:%i:%S');
   
/* ������ 3
	� ������� ��������� ������� storehouses_products � ���� value ����� ����������� ����� ������ �����: 0, ���� ����� ���������� � ���� ����, ���� �� ������ ������� ������. 
	���������� ������������� ������ ����� �������, ����� ��� ���������� � ������� ���������� �������� value. ������ ������� ������ ������ ���������� � �����, ����� ���� 
 */   
SELECT value FROM storehouses_products ORDER BY case when value then 0 else 1 end, value

/* ������ 4
	����������� ������� ������� ������������� � ������� users.
 */
SELECT name,
AVG(FLOOR((TO_DAYS(NOW()) - TO_DAYS(birthday_at)) / 365.25)) AS avg_age
FROM users;
