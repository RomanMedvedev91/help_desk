require 'date'

def test_method
  puts Date.today
  puts Date.today - 1
end


<%= pie_chart StatTechnician.group(:name).count  , 
    title: "Number of tickets per technecian", 
    library: {hAxis: {title: "Technecian name"}, 
              vAxis: {title: "Number of tickets assigned"}}, 
              label: "id"
%>

<%= pie_chart StatTicket.group(:code).where(code: ["Medium","Low","High"]).count  , 
    title: "Number of tickets per priority", 
    library: {hAxis: {title: "Priority"}, 
              vAxis: {title: "Number of tickets"}} , 
    label: "id"
%>

<%= pie_chart StatTicket.group(:code).where(code: ["Opened","Waiting","Assigned"]).count  , title: "Number of tickets per status", library: {hAxis: {title: "Status"}, vAxis: {title: "Number of tickets"}} , label: "id"%>

<%= pie_chart StatTicket.group(:code).where(code: ["Call","Website"]).count  , title: "Number of tickets per category", library: {hAxis: {title: "Category name"}, vAxis: {title: "Number of tickets"}} , label: "id"
column_chart StatTechnician.group(:name).count  , title: "Number of tickets per type", library: {hAxis: {title: "Type"}, vAxis: {title: "Number of tickets"}} , label: "id"
%>
<br>
  </div>
</body>