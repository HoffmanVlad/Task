import time
from bs4 import BeautifulSoup
import requests
from selenium import webdriver
import psycopg2 as pgsql


try:
    print('Start...')
    """Передаем url в requests"""
    url = 'https://www.kijiji.ca/b-apartments-condos/city-of-toronto/c37l1700273'
    response = requests.get(url)
    soup = BeautifulSoup(response.text, 'lxml')
    """Подключаем селениум для браузера"""
    driver = webdriver.Chrome()
    driver.get(url=url)
    time.sleep(5)
    """Ищим основной класс где находяться карточки """
    main = soup.findAll('div', class_='search-item top-feature')
    """записываем html страницу для удобного парсинга в отдельный файл  """
    with open('selenium.html', 'w', encoding="utf-8") as f:
        f.write(driver.page_source)
    """Открываем нашу скачаную html страницу и начинаем искать нужные елементы  """
    with open('selenium.html', 'r') as file:
        price = soup.findAll('div', class_='price')
        for money in price:
            print(money.text.strip())
            t = money.get_text()
        title = soup.findAll('a', class_='title')
        for i in title:
            print(i.text.strip())
            tt = i.get_text()
        date = soup.findAll('span', class_='date-posted')
        for dating in date:
            print(dating.text.strip())
            ttt = dating.get_text()
        location = soup.findAll('div', class_='location')
        for loc in location:
            print(loc.text.strip())
            tttt = loc.get_text()
        bads = soup.findAll('span', class_='bedrooms')
        for bedrooms in bads:
            print(bedrooms.text.strip())
            ttttt = bedrooms.get_text()
        description = soup.findAll('div', class_='description')
        for descr in description:
            print(descr.text.strip())
            tttttt = descr.get_text()

        print('stop parser...')
        time.sleep(1)
        print('connect database...')
        """Подключаем базу данный postgresql """
        connection = pgsql.connect(database='task', user='vlad', password='1', host='localhost',
                                   port='5432')
        print('Подключение к базе данных выполнено успешно')
        cursor = connection.cursor()
        create_table_query = '''CREATE TABLE main (ID SERIAL PRIMARY KEY , MONEYS TEXT NOT NULL, TITLE TEXT NOT NULL, DAYS TEXT NOT NULL, LOCATION TEXT NOT NULL, BEDS TEXT NOT NULL, DESCRIPTION TEXT NOT NULL); '''
        cursor.execute(create_table_query)
        print('Table Create')
        """Передаем наши переменные для записи в базу данных """
        args = (t, tt, ttt, tttt, ttttt, tttttt)
        tee = f"""INSERT INTO main (MONEYS, TITLE, DAYS, LOCATION, BEDS, DESCRIPTION) VALUES {args};"""
        cursor.execute(tee)
        connection.commit()
        print("Write Okey good!!!")
        connection.close()


except Exception as ex:
    print(ex)
    print('Error Exeptions')