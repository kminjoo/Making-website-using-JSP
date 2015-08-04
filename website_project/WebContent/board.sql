CREATE TABLE board (
  idx int primary key,
  firstname varchar(30),
  lastname varchar(30),
  email varchar(50),
  title varchar(200),
  content varchar(4000),
  pwd varchar(10),
  wdate date,
  hit int
);

Update  board  set firstname='Minjoo', lastname='Kwon', email = 'zeptra17@gmail.com', title='The ''Blessed'' World War That Made Modern Iceland', content='Named for the drifting Arctic ice that has blocked its coasts for centuries, Iceland has long relied on the sea ? from the underwater volcanic eruptions that first formed the land mass to the abundant supply of fish that feeds its people. Less well known is how the sea granted Iceland a strategic location between belligerents during World War II ? one that eventually served as a welcome foothold for the Allies in the battle for the Atlantic. True, a number of Icelandic fishermen perished in German attacks, but that period is still referred to by Icelanders as ¢®¡Æthe Blessed War,¢®¡¾ says Thorvaldur Gylfason, a professor of economics at the University of Iceland, because it transformed their country from ¢®¡Æbust to boom.¢®¡¾

[Iceland] was basically a bunch of mud huts in 1900 and still quite primitive in terms of infrastructure [in the early ¢®?40s].

Gu??mundur J?nsson, history professor at the University of Iceland

From his office, Gu??mundur J?nsson, Gylfason¢®?s colleague in the history department, can see Reykjavik Airport ? a relic that dates to 1940, when British forces came ashore and ¢®¡Æoccupied¢®¡¾ Iceland in a bid to save it from Nazi invasion. They built the airfield ? still used for domestic flights ? to serve their transport needs. Icelandic authorities formally complained about the occupation but told islanders to welcome their new guests, and most folks, historians say, were relieved it was the Brits and not the Germans who landed first. While Nazism enjoyed a small measure of success there, winning 2.8 percent of the vote in Reykjavik local elections in 1934, it never gained widespread popularity. When the Americans entered the war in 1941, they freed up their British allies by taking over the Icelandic occupation a year later.

U.S. soldiers found themselves on an island still reeling from the Great Depression. Throughout the 1930s, ¢®¡Æmarkets were down, GDP contracted and unemployment rose,¢®¡¾ says J?nsson. Bilateral trade treaties in Europe had disadvantaged Iceland by driving down fish exports and pushing up unemployment. Soon after the war broke out, Brits began importing Icelandic fish, which helped, but the island ¢®¡Æwas basically a bunch of mud huts in 1900 and still quite primitive in terms of infrastructure¢®¡¾ in the early ¢®?40s, J?nsson explains.

So the American troops, in need of facilities, brought an infusion of cash, engineering know-how and equipment to ensure that roads, buildings and bridges would be constructed at a fast clip. They trained locals to do the work, and once the facilities were built, they still needed maintenance. All that work eased unemployment and put lots of cash into circulation ? not least because workers typically got higher wages than traditional island jobs offered. Before long, an American base along with Keflav?k Airport ? the island¢®?s main air transport facility today ? had been completed, giving the country a much-needed modern makeover.

' where idx=13
select * from board;
delete from board where idx >= 1;
create sequence board_seq increment by 1 start with 1;
drop sequence board_seq;
drop table board;

insert into  board  values( board_seq.nextval ,'Minjoo','Kwon','zeptra17@gmail.com','it's gonna work','plz','1234',sysdate,0)