Math.max(...$("pre").innerText.split`\n\n`.map(e=>e.split`\n`.reduce((a,v)=>+v+a,0)))
