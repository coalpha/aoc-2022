$`pre`.innerText.match(/.+\n.+\n.+/g,z=0).map(g=>{[i,j,k]=g.split`\n`;C=[...i].find(c=>j.includes(c)&k.includes(c)),z+=C.charCodeAt(0)-(C>"Z"?96:38)}),z
