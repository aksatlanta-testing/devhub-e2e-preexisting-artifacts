
{{- define "go-echoe82031e4-d9b8-4d5e-b077-a508f361218a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe82031e4-d9b8-4d5e-b077-a508f361218a.fullname" -}}
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


{{- define "go-echoe82031e4-d9b8-4d5e-b077-a508f361218a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe82031e4-d9b8-4d5e-b077-a508f361218a.labels" -}}
helm.sh/chart: {{ include "go-echoe82031e4-d9b8-4d5e-b077-a508f361218a.chart" . }}
{{ include "go-echoe82031e4-d9b8-4d5e-b077-a508f361218a.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe82031e4-d9b8-4d5e-b077-a508f361218a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe82031e4-d9b8-4d5e-b077-a508f361218a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}