var fs      = require('fs');
var md      = require('markdown');
var dir     = './markdown/';
var template= 'index.tpl';
var output  = 'index.html';
var filesAr = [];
var mdBuff  = '';

filesAr = fs.readdirSync(dir);
filesAr.sort();
for(var i=0; i<filesAr.length; i++){
    mdBuff = mdBuff + fs.readFileSync(dir + filesAr[i], 'utf8') + "\n";
}
html = md.markdown.toHTML(mdBuff);
tpl  = fs.readFileSync(template,'utf8');
tplAr= tpl.split('{CONTENT}');
outHTML = tplAr.join(html);
fs.writeFileSync(output, outHTML, 'utf8');
