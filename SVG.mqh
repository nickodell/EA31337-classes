//+------------------------------------------------------------------+
//|                                                      plotSVG.mqh |
//+------------------------------------------------------------------+
#property copyright ""
#property link      ""
#property strict
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class SVG
  {
   int               x,y,t;
   int               tdiff;
   int               filehandle;

public:
   void SVG(string filename)
     {
      string svg="<svg viewBox='0 0 500 100' class='chart'><polyline fill='none' stroke='#0074d9' stroke-width='2' points='";
      filehandle=FileOpen(filename,FILE_WRITE,',');
      FileWrite(filehandle,svg);
     }
   void ~SVG()
     {
      string svgend="' /></svg>";

      FileWrite(filehandle,svgend);
      FileClose(filehandle);
     }
   void plot()
     {

      if(filehandle!=INVALID_HANDLE)
        {

         int i=Bars;
         t=0;
         while(i-->0)
           {
            x=TimeHour(Time[i])*TimeMinute(Time[i]);
            tdiff=(Time[0]-Time[i]); //time 0 dla pierwszego bara od lewej
            y=(Time[Bars-1]-Time[i])/-100;
            FileWrite(filehandle,t++,High[i]);

           }

        }
      else Print("File open failed, error ",GetLastError());

     }
  

  };
