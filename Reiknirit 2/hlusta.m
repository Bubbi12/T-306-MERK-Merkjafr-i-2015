function hlusta(filterinn,nr,fs)
hold on;
subplot(3,1,nr)
  axis([0 3.5 -1 1]);
  line = plot([0],[0]);
  for t=linspace(0,3.5,50)
      delete(line)
      if t==0
        soundsc(filterinn,fs)
      end
      line = plot([t t],[-1 1],'-k');
      plot(line);
      pause(0.07034)
  end
  delete(line)
hold off;
end

