<!DOCTYPE HTML>
<html>
<head>
  <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="chrome=1" />
  <meta name="viewport" content="width=device-width">
  <link href="style.css" media="screen" rel="stylesheet" type="text/css">
  <title>Linen User Guide</title>
</head>
<body>
  <div id="sidebar" class="interface">
  </div><!-- /div#sidebar -->
  <div class="main">
      {CONTENT}
  </div><!-- /div.main -->
  <script src="jquery.min.js"></script>
  <script src="underscore-min.js"></script>

  <script>
jQuery(document).ready(function() {
    var items = [];
    var prevH1 = '';
    var headings = jQuery('h1,h2');
    var SI = '';
    var prevItem = '';
    _.each(headings, function(i){
        var str = i.innerHTML;
        var strs= str.replace(/\W+/g,'-');
        var id = '';
        if(i.tagName=='H1'){
            items.push({
                'href':strs,
                'title':str,
                'type':'H1'
            });
            prevH1 = strs;
            id = strs;
        }else{
            items.push({
                'href':prevH1+'/'+strs,
                'title':str,
                'type':'H2'
            });
            id = prevH1+'/'+strs;
        }
        jQuery(i).attr('id',id);
    });        
    
    _.each(items, function(i){
        if(i.type=='H2' && prevItem!='H2'){
            SI = SI + '<ul class="toc_section">';
        }
        if(i.type=='H2'){
            SI = SI + '<li><a href="#'+i.href+'">'+i.title+'</a></li>';
            prevItem = 'H2';
        }
        if(i.type=='H1' && prevItem=='H2'){
            SI = SI + '</ul>';
        }
        if(i.type=='H1'){
            SI = SI + '<a class="toc_title" href="#'+i.href+'">'+i.title+'</a>';
            prevItem = 'H1';
        }
    })
        
    if(prevItem=='H2'){
        SI = SI + '</ul>';
    }

    jQuery('#sidebar').html(SI);

});
  </script>
</body>
</html>
