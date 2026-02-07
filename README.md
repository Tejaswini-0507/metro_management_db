<h1>Metro Management System (Database Porject) </h1>
<h2> Project Overview</h2>
<p> This project is a Metro Management System implemented using PostgreSQL.
It focuses on designing a normalized database schema and enforcing real-world metro rules using constraints, triggers, and functions.
The system manages stations, routes, trains, users, tickets, and transactions while ensuring data integrity at the database level.
</p>

<h3>Database schema Creation</h3>
<p> Created the following tables:</p>
<ul>
  <li>station</li>
  <li>routes</li>
  <li>trains</li>
  <li>train_stops</li>
  <li>users</li>
  <li>tickets</li>
  <li>transactions</li>
</ul>
<p>Implemented:</p>
<ul> 
    <li>Primary keys and foreign keys</li>
  <li>Unique and check constraints</li>
  <li>Index on trains(route_id) for performance</li>
</ul>

<h3>Trigger Implementation
</h3>
<p>Created triggers to automate critical operations:</p>
<ul>
  <li>Automatic calculation of ticket expiry time</li>
  <li>Automatic calculation of train departure time</li>
  <li>validation of ticket status during usage</li>
</ul>

<h3> Functions,procedures & Data Testing</h3>
<ul>
  <li>Created a user-defined function to calculate fare based on distance</li>
</ul>

<h2>Core Features Implemented</h2>
<ul>
  <li>Ticket lifecycle management (VALID, USED,EXPIRED)</li>
  <li>Fare calculation based on route distance</li>
  <li>Automatic expiry and dearture time calculation</li>
  <li>Prevention of ticket reuse using transactions</li>
  <li>Support for multiple tickets per user</li>
  <li>Proper relational integirty using foreign keys</li>
</ul>

<h2>Technologies used</h2>
<ol>
  <li>PostgreSQL</li>
  <li>SQL</li>
  <li>pgAdmin</li>
  <li>Git & GitHub</li>
</ol>
