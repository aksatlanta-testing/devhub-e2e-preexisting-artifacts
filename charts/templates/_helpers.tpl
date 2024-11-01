
{{- define "go-echof6493b48-3323-42a1-b910-e2fe93149a18.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof6493b48-3323-42a1-b910-e2fe93149a18.fullname" -}}
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


{{- define "go-echof6493b48-3323-42a1-b910-e2fe93149a18.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof6493b48-3323-42a1-b910-e2fe93149a18.labels" -}}
helm.sh/chart: {{ include "go-echof6493b48-3323-42a1-b910-e2fe93149a18.chart" . }}
{{ include "go-echof6493b48-3323-42a1-b910-e2fe93149a18.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof6493b48-3323-42a1-b910-e2fe93149a18.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof6493b48-3323-42a1-b910-e2fe93149a18.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}