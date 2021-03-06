program CodeCoverage;
{$APPTYPE CONSOLE}
{$INCLUDE CodeCoverage.inc}

uses
  SysUtils,
  BreakPoint in 'BreakPoint.pas',
  BreakpointList in 'BreakpointList.pas',
  CommandLineProvider in 'CommandLineProvider.pas',
  CoverageConfiguration in 'CoverageConfiguration.pas',
  CoverageStats in 'CoverageStats.pas',
  HTMLCoverageReport in 'HTMLCoverageReport.pas',
  Debugger in 'Debugger.pas',
  DebugProcess in 'DebugProcess.pas',
  DebugThread in 'DebugThread.pas',
  I_BreakPoint in 'I_BreakPoint.pas',
  I_BreakPointList in 'I_BreakPointList.pas',
  I_CoverageConfiguration in 'I_CoverageConfiguration.pas',
  I_CoverageStats in 'I_CoverageStats.pas',
  I_Debugger in 'I_Debugger.pas',
  I_DebugProcess in 'I_DebugProcess.pas',
  I_DebugThread in 'I_DebugThread.pas',
  I_Logger in 'I_Logger.pas',
  I_LogManager in 'I_LogManager.pas',
  I_ParameterProvider in 'I_ParameterProvider.pas',
  I_Report in 'I_Report.pas',
  JclDebug in 'JclDebug.pas',
  LoggerAPI in 'LoggerAPI.pas',
  LoggerTextFile in 'LoggerTextFile.pas',
  LogManager in 'LogManager.pas',
  XMLCoverageReport in 'XMLCoverageReport.pas',
  ClassInfoUnit in 'ClassInfoUnit.pas',
  CoverageDataUnit in 'CoverageDataUnit.pas',
  EmmaDataFile in 'EmmaDataFile.pas',
  FileHelper in 'FileHelper.pas',
  MergableUnit in 'MergableUnit.pas',
  MetaDataUnit in 'MetaDataUnit.pas',
  EmmaCoverageFileUnit in 'EmmaCoverageFileUnit.pas',
  DebugModule in 'DebugModule.pas',
  I_DebugModule in 'I_DebugModule.pas',
  ModuleNameSpaceUnit in 'ModuleNameSpaceUnit.pas',
  uConsoleOutput in 'uConsoleOutput.pas',
  HtmlHelper in 'HtmlHelper.pas';

var
  // Delphi 7 leaks interfaces from here :-(
  ADebugger: TDebugger;
{$DEFINE FullDebugMode}

begin
  try
    ADebugger := TDebugger.Create;
    try
      ADebugger.Start();
    finally
      ADebugger.Free;
    end;
  except
    on E: Exception do
      WriteLn(E.ClassName, ': ', E.message);
  end;
{$IFDEF DEBUG}
  Writeln('Code Coverage finished.');
  Write('Press Enter to close the console >');
  Readln;
{$ENDIF}

end.
