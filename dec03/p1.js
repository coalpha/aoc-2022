$("pre").innerText.trim(z=0).split`\n`.map(l=>z+=(l=[...l.slice(L=l.length/2)].find(c=>l.slice(0,L).includes(c))).charCodeAt(0)-(l>"Z"?96:38)),z
