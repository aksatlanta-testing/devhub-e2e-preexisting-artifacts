
{{- define "go-echod5c16fdc-4f7e-49ad-b33d-c23d8cb15a06.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod5c16fdc-4f7e-49ad-b33d-c23d8cb15a06.fullname" -}}
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


{{- define "go-echod5c16fdc-4f7e-49ad-b33d-c23d8cb15a06.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod5c16fdc-4f7e-49ad-b33d-c23d8cb15a06.labels" -}}
helm.sh/chart: {{ include "go-echod5c16fdc-4f7e-49ad-b33d-c23d8cb15a06.chart" . }}
{{ include "go-echod5c16fdc-4f7e-49ad-b33d-c23d8cb15a06.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod5c16fdc-4f7e-49ad-b33d-c23d8cb15a06.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod5c16fdc-4f7e-49ad-b33d-c23d8cb15a06.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}