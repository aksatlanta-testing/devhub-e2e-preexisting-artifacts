
{{- define "go-echoaf472a3f-fc59-4f30-89a4-548c67e5e383.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaf472a3f-fc59-4f30-89a4-548c67e5e383.fullname" -}}
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


{{- define "go-echoaf472a3f-fc59-4f30-89a4-548c67e5e383.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaf472a3f-fc59-4f30-89a4-548c67e5e383.labels" -}}
helm.sh/chart: {{ include "go-echoaf472a3f-fc59-4f30-89a4-548c67e5e383.chart" . }}
{{ include "go-echoaf472a3f-fc59-4f30-89a4-548c67e5e383.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaf472a3f-fc59-4f30-89a4-548c67e5e383.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaf472a3f-fc59-4f30-89a4-548c67e5e383.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}