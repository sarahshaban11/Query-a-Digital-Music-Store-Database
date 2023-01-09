
/*Q1: What Media Type did customers prefer buy?*/
Select mt.name,Count(DISTINCT c.customerid)Customers
From customer c
Join invoice i
On c.customerid = i.customerid
Join invoiceline iv
On i.invoiceid = iv.invoiceid
Join Track t
On iv.trackid = t.trackid
Join MediaType mt
On mt.mediatypeid = t.mediatypeid
Group by mt.name
Order by c.customerid DESC;

/*Q2:return number of albums each artist whom did more than one in desc order*/
Select Artist.Name,count(Album.AlbumId)AS number_ofAllbums
From Artist
JOIN Album on(Artist.ArtistId == Album.ArtistId)
GROUP BY Artist.Name
HAVING number_ofAllbums>1
ORDER BY number_ofAllbums DESC ;

/*Q3: return the sum of each  customer total amount they paid in a transaction  */
Select Customer.CustomerId,Sum(Invoice.Total)AS Sum_of_total_affairs
from Customer
JOIN Invoice ON(Customer.CustomerId == Invoice.CustomerId)
GROUP BY Customer.CustomerId;

/*Q4: Top 10 Albums based on sales?*/

Select a.albumid, a.title, ar.name AS Artist_Name, Sum(iv.unitprice * iv.quantity) As Sales
FROM Artist ar
join Album a
ON ar.artistid = a.artistid
JOIN Track t
ON a.albumid = t.albumid
JOIN InvoiceLine iv
ON iv.trackid = t.trackid
GROUP BY a.albumid
ORDER BY Sales DESC
Limit 10;

