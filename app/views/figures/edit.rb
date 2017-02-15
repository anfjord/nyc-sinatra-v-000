<%require 'pry'%>
<h3>Edit <%=@figure.name%>:</h3>
<form action="/figures/<%=@figure.id%>" method="post">
  <input id="hidden" type="hidden" name="_method" value="patch">
  <label for="figure_name">Figure:</label>
  <input type="text" name="figure[name]" id="figure_name" value="<%=@figure.name%>">
  <br></br>
  <h4>Select title/s:</h4>
  <%Title.all.each do |title|%>
    <input type="checkbox" name="figure[title_ids][]" value="<%=title.id%>"
    id="<%=title.name%>" <%='checked' if @figure.titles.include?(title)%>><%=title.name%></input>

  <%end%>

  <p>and/or <b>create</b> a new title:</p>
  <label for="new_title">Title:</label>
  <input type="text" name="title[name]" id="new_title">

  <br></br>
  <h4>Select landmark/s:</h4>
  <%Landmark.all.each do |landmark|%>
    <input type="checkbox" name="figure[landmark_ids][]" value="<%=landmark.id%>"
    id="<%=landmark.name%>" <%='checked' if @figure.landmarks.include?(landmark)%>><%=landmark.name%></input>
  <%end%>

  <p>and/or <b>create</b> a new landmark:</p>
  <label for="new_landmark">Landmark:</label>
  <input type="text" name="landmark[name]" id="new_landmark">

  <br></br>
  <input type="submit" value="Edit Figure">
</form>
