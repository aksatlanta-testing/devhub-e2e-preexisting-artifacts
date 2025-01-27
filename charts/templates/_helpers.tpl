
{{- define "go-echofb5def06-66b2-43a9-ab3f-b327390ed6ae.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofb5def06-66b2-43a9-ab3f-b327390ed6ae.fullname" -}}
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


{{- define "go-echofb5def06-66b2-43a9-ab3f-b327390ed6ae.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofb5def06-66b2-43a9-ab3f-b327390ed6ae.labels" -}}
helm.sh/chart: {{ include "go-echofb5def06-66b2-43a9-ab3f-b327390ed6ae.chart" . }}
{{ include "go-echofb5def06-66b2-43a9-ab3f-b327390ed6ae.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofb5def06-66b2-43a9-ab3f-b327390ed6ae.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofb5def06-66b2-43a9-ab3f-b327390ed6ae.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}