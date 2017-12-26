/
    Title: Search engine logging for code.kx.com
    Authors: mark@kx.com, stephen@kx.com

    Usage: /q loggr.q -p 5202
\

// INITIALISE LOGGING

.log.FOLDER: (system "cd"),"/logs/";
.log.POINTER: 0;
.log.number: {`$":",.log.FOLDER,(string x),"-",(-5#"0000",string y),".log"};  

/HTTP request keys
.log.HK: `$(
    "Host";
    "Connection";
    "Cache-Control";
    "Upgrade-Insecure-Requests";
    "User-Agent";
    "Accept";
    "Accept-Encoding";
    "Accept-Language";
    "Cookie"
    );  
/ .log.hk: `$ (except')[;"-"] lower string .log.HK;           /as simple q symbols
.log.NHP: {x!count[x]#enlist""}.log.HK;                     /no HTTP parameters

/ IN-MEMORY EVENT LOG
events: flip {x!count[x]#()}`evt`rcv`ok`usr`str , .log.HK; 
events,: ![`evt`rcv`ok`usr`str;(`startlog; .z.p; 1b; `logger; "")], .log.NHP;

.log.HEADER: "," sv string cols events;

/ identify latest log
.log.MONTH: "m"$.z.p;
niq: {x where string[.log.MONTH]~/:7#'x}string key`$.log.FOLDER;
niq: $[count[niq]=0; 0; max"I"$-5#' -4_'niq];               /perhaps not all consecutive logs
.log.FILEPATH: .log.number[.log.MONTH;niq]; 

.log.write:{[]
    if[.log.POINTER>=count events; :0];                     /nothing to write
    / if new month, open first log 
    .log.FILEPATH: {$[.log.MONTH=m:"m"$.z.p; x; .log.number[;0].log.MONTH:m]} .log.FILEPATH;
    / if file over size limit, start next log
    .log.FILEPATH: {$[not x~key x; x; hcount[x]<10000000; x; .log.number[.log.MONTH;] 1+"J"$-5#string x]} .log.FILEPATH;
    h: @[hopen;.log.FILEPATH;`$"failed to open ",string .log.FILEPATH];
    $[hcount .log.FILEPATH; ; neg[h] .log.HEADER];
    r: count u: {x y+til count[x]-y}[events;.log.POINTER];  /updates
    neg[h] 1 _ csv 0: u;
    hclose h;
    .log.POINTER+: r;
    r
    }; 

.log.format:{[x] 
    r: `evt`rcv`usr!(`request; .z.p; `searcher);
    r[`ok]: $[count[x]<>2; 0b; (type each x)~10 99h];       /expected?
    r[`str]: $[r`ok; x 0; .Q.s x];                          /unexpected?
    $[r`ok; r[.log.HK]: x[1] .log.HK; ];                    /HTTP request parameters
    r
    };


// SET CALLBACKS

.z.exit: {[x]
    events,: ![`evt`rcv`ok`usr`str;(`stoplog; .z.p; 1b; `logger; "")], .log.NHP;
    show "Flushed ",(string .log.write[])," records to log";
    show "Shutting down at ",string .z.p;
    };

.z.po:{[x] /accept connection from searcher
    events,: ![`evt`rcv`ok`usr`str;(`connect; .z.p; 1b; `searcher; "")], .log.NHP;
    };

.z.ps: {[x] 
    show dbgX:: x; 
    events,: .log.format x;
    };        /handle async requests
/refuse other connections
/refuse: {neg[.z.w]"Go away"};
/z.pg: .z.ph: .h.he;                                        /400 bad request
/.z.po: .z.pp: refuse;
// .z.pm:        refuse;      
/.z.wo: .z.ws: refuse;

.z.pg:{neg[.z.w]0N!"Go away from pg"};
.z.pp:{neg[.z.w]0N!"Go away from pp"};
.z.pm:{neg[.z.w]0N!"Go away from pm"};
.z.wo:{neg[.z.w]0N!"Go away from wo"};
.z.ws:{neg[.z.w]0N!"Go away from ws"};


.z.ts: {[x]
    nl: .log.write[];
    $[nl; show "Logged ",string[nl]," records"; ];
    };

system "t 5000"; 

show "Logging search engine at ",1 _ string .log.FILEPATH;

\
