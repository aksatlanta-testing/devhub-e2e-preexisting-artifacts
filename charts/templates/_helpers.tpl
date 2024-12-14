
{{- define "go-echobfc287cf-8e8d-402e-91e7-dea0d0aceedd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobfc287cf-8e8d-402e-91e7-dea0d0aceedd.fullname" -}}
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


{{- define "go-echobfc287cf-8e8d-402e-91e7-dea0d0aceedd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobfc287cf-8e8d-402e-91e7-dea0d0aceedd.labels" -}}
helm.sh/chart: {{ include "go-echobfc287cf-8e8d-402e-91e7-dea0d0aceedd.chart" . }}
{{ include "go-echobfc287cf-8e8d-402e-91e7-dea0d0aceedd.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobfc287cf-8e8d-402e-91e7-dea0d0aceedd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobfc287cf-8e8d-402e-91e7-dea0d0aceedd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}