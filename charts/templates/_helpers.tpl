
{{- define "go-echoc64bb642-5bbe-49ea-83f5-d9f9345631be.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc64bb642-5bbe-49ea-83f5-d9f9345631be.fullname" -}}
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


{{- define "go-echoc64bb642-5bbe-49ea-83f5-d9f9345631be.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc64bb642-5bbe-49ea-83f5-d9f9345631be.labels" -}}
helm.sh/chart: {{ include "go-echoc64bb642-5bbe-49ea-83f5-d9f9345631be.chart" . }}
{{ include "go-echoc64bb642-5bbe-49ea-83f5-d9f9345631be.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc64bb642-5bbe-49ea-83f5-d9f9345631be.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc64bb642-5bbe-49ea-83f5-d9f9345631be.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}