
{{- define "go-echof1101aa3-0342-4932-8fc4-fc694542587c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof1101aa3-0342-4932-8fc4-fc694542587c.fullname" -}}
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


{{- define "go-echof1101aa3-0342-4932-8fc4-fc694542587c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof1101aa3-0342-4932-8fc4-fc694542587c.labels" -}}
helm.sh/chart: {{ include "go-echof1101aa3-0342-4932-8fc4-fc694542587c.chart" . }}
{{ include "go-echof1101aa3-0342-4932-8fc4-fc694542587c.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof1101aa3-0342-4932-8fc4-fc694542587c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof1101aa3-0342-4932-8fc4-fc694542587c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}