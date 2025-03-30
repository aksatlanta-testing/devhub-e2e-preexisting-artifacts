
{{- define "go-echo32f7455e-0d49-46fe-8768-85beba33fa80.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo32f7455e-0d49-46fe-8768-85beba33fa80.fullname" -}}
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


{{- define "go-echo32f7455e-0d49-46fe-8768-85beba33fa80.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo32f7455e-0d49-46fe-8768-85beba33fa80.labels" -}}
helm.sh/chart: {{ include "go-echo32f7455e-0d49-46fe-8768-85beba33fa80.chart" . }}
{{ include "go-echo32f7455e-0d49-46fe-8768-85beba33fa80.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo32f7455e-0d49-46fe-8768-85beba33fa80.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo32f7455e-0d49-46fe-8768-85beba33fa80.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}