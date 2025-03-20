
{{- define "go-echo768ec9b2-fade-4405-91e1-7ee09bd59489.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo768ec9b2-fade-4405-91e1-7ee09bd59489.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echo768ec9b2-fade-4405-91e1-7ee09bd59489.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo768ec9b2-fade-4405-91e1-7ee09bd59489.labels" -}}
helm.sh/chart: {{ include "go-echo768ec9b2-fade-4405-91e1-7ee09bd59489.chart" . }}
{{ include "go-echo768ec9b2-fade-4405-91e1-7ee09bd59489.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo768ec9b2-fade-4405-91e1-7ee09bd59489.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo768ec9b2-fade-4405-91e1-7ee09bd59489.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}