
{{- define "go-echoae8645f9-bdfb-44e2-a3b4-6ec6eec268ab.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoae8645f9-bdfb-44e2-a3b4-6ec6eec268ab.fullname" -}}
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


{{- define "go-echoae8645f9-bdfb-44e2-a3b4-6ec6eec268ab.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoae8645f9-bdfb-44e2-a3b4-6ec6eec268ab.labels" -}}
helm.sh/chart: {{ include "go-echoae8645f9-bdfb-44e2-a3b4-6ec6eec268ab.chart" . }}
{{ include "go-echoae8645f9-bdfb-44e2-a3b4-6ec6eec268ab.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoae8645f9-bdfb-44e2-a3b4-6ec6eec268ab.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoae8645f9-bdfb-44e2-a3b4-6ec6eec268ab.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}