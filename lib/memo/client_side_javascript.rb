
The script is added in view/topic/new 
<script type="text/javascript">
  var blocmetrics = {
    report: function(attr){
      var event = {
        job: {
          name: attr
      }
    }

    var request = new XMLHttpRequest();
    request.open("POST", "http://localhost:3000/api/jobs", true);
    request.setRequestHeader('Content-Type', 'application/json');

    request.onreadystatechange = function() {
      // #2
    };

    request.send(JSON.stringify(event));
  }
}
  $(document).ready(function(){
    $('#commit-and-send').click(function(){
      blocmetrics.report($('#attr-to-send').val());
    })
  })
</script>

In form, id is set for f.text_first and f.submit as 'attr-to-send' and 'commit-and-send'

<%= form_for topic do |f| %>
  <% if topic.errors.any? %>
    <div class = "alert alert-danger">
      <h4>There are <%= pluralize(topic.errors.count, "error") %></h4>
      <ul>
        <%= topic.errors.full_messages.each do |msg| %>
          <li><%= msg %>
        <% end %>
      </ul>
    </div>
   <% end %>
   
   <%= form_group_tag(topic.errors[:name]) do %>
    <%= f.label :name %>
    <%= f.text_field :name, id: 'attr-to-send', class: 'form-control', placeholder: "Enter topic name" %>
    <% end %>
    <div class="form-group">
       <%= f.label :description %>
       <%= f.text_area :description, rows: 8, class: 'form-control', placeholder: "Enter topic description" %>
    </div>
     <div class="form-group">
      <%= f.label :public, class: 'checkbox' do %>
      <%= f.check_box :public %> Public topic
    <% end %>
    </div>
      <%= f.submit "Save", id: 'commit-and-send', class: 'btn btn-success' %>
<% end %>