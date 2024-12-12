
{{- define "go-echo1a420e23-3dd9-4b92-ac85-8017d6fe127e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1a420e23-3dd9-4b92-ac85-8017d6fe127e.fullname" -}}
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


{{- define "go-echo1a420e23-3dd9-4b92-ac85-8017d6fe127e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1a420e23-3dd9-4b92-ac85-8017d6fe127e.labels" -}}
helm.sh/chart: {{ include "go-echo1a420e23-3dd9-4b92-ac85-8017d6fe127e.chart" . }}
{{ include "go-echo1a420e23-3dd9-4b92-ac85-8017d6fe127e.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1a420e23-3dd9-4b92-ac85-8017d6fe127e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1a420e23-3dd9-4b92-ac85-8017d6fe127e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}