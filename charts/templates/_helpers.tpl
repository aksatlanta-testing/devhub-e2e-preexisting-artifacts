
{{- define "go-echo24980c79-71b1-44cc-b3e8-42df164359bc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo24980c79-71b1-44cc-b3e8-42df164359bc.fullname" -}}
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


{{- define "go-echo24980c79-71b1-44cc-b3e8-42df164359bc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo24980c79-71b1-44cc-b3e8-42df164359bc.labels" -}}
helm.sh/chart: {{ include "go-echo24980c79-71b1-44cc-b3e8-42df164359bc.chart" . }}
{{ include "go-echo24980c79-71b1-44cc-b3e8-42df164359bc.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo24980c79-71b1-44cc-b3e8-42df164359bc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo24980c79-71b1-44cc-b3e8-42df164359bc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}