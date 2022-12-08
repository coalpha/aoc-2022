S=r=>r.reduce((a,v)=>+v+a,0);S($("pre").innerText.split`\n\n`.map(e=>S(e.split`\n`)).sort().slice(-3))
