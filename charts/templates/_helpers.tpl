
{{- define "go-echod610219d-9ebd-4e80-b520-a9b3279c2471.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod610219d-9ebd-4e80-b520-a9b3279c2471.fullname" -}}
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


{{- define "go-echod610219d-9ebd-4e80-b520-a9b3279c2471.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod610219d-9ebd-4e80-b520-a9b3279c2471.labels" -}}
helm.sh/chart: {{ include "go-echod610219d-9ebd-4e80-b520-a9b3279c2471.chart" . }}
{{ include "go-echod610219d-9ebd-4e80-b520-a9b3279c2471.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod610219d-9ebd-4e80-b520-a9b3279c2471.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod610219d-9ebd-4e80-b520-a9b3279c2471.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}