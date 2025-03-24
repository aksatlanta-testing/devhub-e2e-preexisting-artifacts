
{{- define "go-echoa2d9e2fd-bb74-4844-b6f5-6050e42ab207.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa2d9e2fd-bb74-4844-b6f5-6050e42ab207.fullname" -}}
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


{{- define "go-echoa2d9e2fd-bb74-4844-b6f5-6050e42ab207.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa2d9e2fd-bb74-4844-b6f5-6050e42ab207.labels" -}}
helm.sh/chart: {{ include "go-echoa2d9e2fd-bb74-4844-b6f5-6050e42ab207.chart" . }}
{{ include "go-echoa2d9e2fd-bb74-4844-b6f5-6050e42ab207.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa2d9e2fd-bb74-4844-b6f5-6050e42ab207.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa2d9e2fd-bb74-4844-b6f5-6050e42ab207.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}